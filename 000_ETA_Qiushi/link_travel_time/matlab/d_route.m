close all;
clear all;
% clc;

% take 4 nodes and 4 links as an example
% ¿É´ï¾ØÕó
n = 4;
m_node = [1 1 1 0;
          1 1 0 1;
          1 0 1 1;
          0 1 1 1;];
% data of links
big = 1000;
T = 30;
link_time = zeros(n*n,T);
for i = 1:n
    for j = 1:n
       if(i ~= j)
           if(m_node(i,j))
               link_time(link_no(i,j,n),:) = ceil(5.*rand([1,30]));
           else
               link_time(link_no(i,j,n),:) = big;
           end
       end
    end
end

dest = 4;
org = 1;
t0 = 1;
F = zeros(n,T);
for i = 1:n
   F(i,:) = link_time(link_no(i,dest,n),:);
end

path = [];
for i = t0:T
   for j = org:org
      if(j == dest)
          continue;
      end
      min_t = F(j,t0);
      for k = 1:n
          if (link_time(link_no(j,k,n),t0) > T)
             continue; 
          end
          if(min_t > link_time(link_no(j,k,n),t0) + F(k,t0 + link_time(link_no(j,k,n),t0)))
              min_t = link_time(link_no(j,k,n),t0) + F(k,t0 + link_time(link_no(j,k,n),t0));
              min_node = k;
              path(length(path)+1) = min_node;
          end
      end
      F(j,t0) = min_t;      
   end
end
path(length(path)+1) = dest;
disp(path)