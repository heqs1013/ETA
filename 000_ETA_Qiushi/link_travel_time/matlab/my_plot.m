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
y3(1) = data(1);    %��һ������ȡԭ����
for i = 2:L
   y3(i) = a*data(i) + (1-a)*y3(i-1);   %ָ��ƽ��
end

a = 0.5;
y4 = zeros(L,1);
y4(1) = data(1);    %��һ������ȡԭ����
for i = 2:L
   y4(i) = a*data(i) + (1-a)*y4(i-1);   %ָ��ƽ��
end

%ָ��ƽ���������߻�������ͬ�ϣ�
figure;
x = 1:L;
plot(x,data(x),'-k',x,y3(x),'-b',x,y4(x),'-r','LineWidth',1.5);
legend('ԭͼ','a=0.2ָ��ƽ��','a=0.5ָ��ƽ��');
% hold on;
% plot(xx,y33(xx/10),'ob','LineWidth',2,'MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor',[0.6,0.7,0.8]);
% hold on;
% plot(xx,y44(xx/10),'or','LineWidth',2,'MarkerSize',6,'MarkerEdgeColor','r','MarkerFaceColor',[1,0.6,0.5]);
title('ָ��ƽ����','FontName','΢���ź�','FontSize',13);
xlabel('ʱ��','FontName','Times New Roman','FontSize',10);
ylabel('����','FontName','Times New Roman','FontSize',10);
grid on;
box on;

%���ƶ�ƽ����
n = 10;
y1 = zeros(L,1);
%ǰn�����������㣬ȡ��ԭ�������
for i = 1:n
   y1(i) = data(i) * n; 
end
for i = n+1:L
   for j = 1:n
      y1(i) = y1(i) + data(i - j);  %���
   end
end
y1 = y1 / n;    %ƽ��

n = 30;
y2 = zeros(L,1);
%ǰn�����������㣬ȡ��ԭ�������
for i = 1:n
   y2(i) = data(i) * n; 
end
for i = n+1:L
   for j = 1:n
      y2(i) = y2(i) + data(i - j);  %���
   end
end
y2 = y2 / n;    %ƽ��

%��ͼ
x = 1:L-30;
%�ƶ�ƽ��
figure;
plot(x,data(x),'-k',x,y1(x+5),'-b',x,y2(x+15),'-r','LineWidth',1.5); %ָ��������ɫ����ʽ���߿�
legend('ԭͼ','N=10�ƶ�ƽ��','N=30�ƶ�ƽ��'); %ͼ��
grid on;
box on;