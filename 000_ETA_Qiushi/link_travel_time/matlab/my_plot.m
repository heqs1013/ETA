clc;
close all;

dta = load('link0.csv');
% xa = 2:1:241;
% ya = 1:1:31;
% [x,y] = meshgrid(xa,ya);
% z = dta(xa,ya)';
% mesh(x,y,z)

a = 0.2;
data = dta(2:241,1);
[L,~] = size(data);
y3 = zeros(L,1);
y3(1) = data(1);    %第一个数据取原数据
for i = 2:L
   y3(i) = a*data(i) + (1-a)*y3(i-1);   %指数平均
end

a = 0.5;
y4 = zeros(L,1);
y4(1) = data(1);    %第一个数据取原数据
for i = 2:L
   y4(i) = a*data(i) + (1-a)*y4(i-1);   %指数平均
end

%指数平滑法（曲线绘制设置同上）
figure;
x = 1:L;
plot(x,data(x),'-k',x,y3(x),'-b',x,y4(x),'-r','LineWidth',1.5);
legend('原图','a=0.2指数平滑','a=0.5指数平滑');
% hold on;
% plot(xx,y33(xx/10),'ob','LineWidth',2,'MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[0.6,0.7,0.8]);
% hold on;
% plot(xx,y44(xx/10),'or','LineWidth',2,'MarkerSize',6,'MarkerEdgeColor','r','MarkerFaceColor',[1,0.6,0.5]);
title('指数平滑法','FontName','微软雅黑','FontSize',13);
xlabel('时间','FontName','Times New Roman','FontSize',10);
ylabel('流量','FontName','Times New Roman','FontSize',10);
grid on;
box on;

%简单移动平均法
n = 10;
y1 = zeros(L,1);
%前n个数据量不足，取与原数据相等
for i = 1:n
   y1(i) = data(i) * n; 
end
for i = n+1:L
   for j = 1:n
      y1(i) = y1(i) + data(i - j);  %求和
   end
end
y1 = y1 / n;    %平均

n = 30;
y2 = zeros(L,1);
%前n个数据量不足，取与原数据相等
for i = 1:n
   y2(i) = data(i) * n; 
end
for i = n+1:L
   for j = 1:n
      y2(i) = y2(i) + data(i - j);  %求和
   end
end
y2 = y2 / n;    %平均

%绘图
x = 1:L-30;
%移动平均
figure;
plot(x,data(x),'-k',x,y1(x+5),'-b',x,y2(x+15),'-r','LineWidth',1.5); %指定曲线颜色、样式和线宽
legend('原图','N=10移动平均','N=30移动平均'); %图例
grid on;
box on;