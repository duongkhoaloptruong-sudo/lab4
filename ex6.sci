x=[1 2 -3 2 1];
nx=0:4;
h=[1 0 -1];
nh=0:2;

ny=nx(1)+nh(1):nx($)+nh($);
y1=zeros(1,length(ny));

hf=h($:-1:1);
nhf=-nh($:-1:1);

for i=1:length(ny)
    n=ny(i);
    ns=nhf+n;
    s=0;
    for j=1:length(ns)
        idx=find(nx==ns(j));
        if ~isempty(idx) then
            s=s+hf(j)*x(idx);
        end
    end
    y1(i)=s;
end

disp(y1);

x=[1 2 -3 2 1];
h=[1 0 -1];

Lx=length(x);
Lh=length(h);
Ly=Lx+Lh-1;

H=zeros(Ly,Lx);
for i=1:Ly
    for j=1:Lx
        k=i-j+1;
        if k>=1 & k<=Lh then
            H(i,j)=h(k);
        end
    end
end

y2=(H*x')';
disp(H);
disp(y2);

x=[1 2 -3 2 1];
nx=0:4;
h=[1 0 -1];
y=convol(x,h);
ny=0:length(y)-1;

ex=abs(x).^2;
ey=abs(y).^2;
Ex=sum(ex);
Ey=sum(ey);

scf(0);
clf();

subplot(2,2,1);
plot2d3(nx,x,style=2);
plot(nx,x,'bo');
a=gca();
a.data_bounds=[-1,-4;5,3];
xtitle('Tin hieu x(n)','n','x(n)');
xgrid();

subplot(2,2,2);
plot2d3(ny,y,style=5);
plot(ny,y,'ro');
a=gca();
a.data_bounds=[-1,-5;7,5];
xtitle('Tin hieu y(n)','n','y(n)');
xgrid();

subplot(2,2,3);
plot2d3(nx-0.05,ex,style=2);
plot2d3(ny+0.05,ey,style=5);
a=gca();
a.data_bounds=[-1,0;7,16];
xtitle('Nang luong tung mau','n','nang luong');
legend('|x(n)|^2','|y(n)|^2');
xgrid();

subplot(2,2,4);
bar([Ex Ey],0.8,'blue');
a=gca();
a.data_bounds=[0.5,0;2.5,45];
xtitle('Tong nang luong: Ex = '+string(Ex)+' (cot 1), Ey = '+string(Ey)+' (cot 2)');
xgrid();

disp(Ex);
disp(Ey);
