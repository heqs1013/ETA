function [no] = link_no(i,j,n)
% transfer the link between node i and node j to link index
% 1 <= i,j <= n
no = (i-1)*n+j;