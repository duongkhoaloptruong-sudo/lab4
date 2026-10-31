x=[1 2 -3 2 1];
h=[1 0 -1 -1 1];
N=length(x);
M=length(h);
m=0:N-1;

hf=h(pmodulo(-m,N)+1);

y1=zeros(1,N);
for n=0:N-1
    hs=hf(pmodulo(m-n,N)+1);
    y1(n+1)=sum(hs.*x);
end

disp(y1);

x=[1 2 -3 2 1];
h=[1 0 -1 -1 1];
N=length(x);

H=zeros(N,N);
for i=0:N-1
    for j=0:N-1
        H(i+1,j+1)=h(pmodulo(i-j,N)+1);
    end
end

y2=(H*x')';
disp(H);
disp(y2);

x=[1 2 -3 2 1];
nx=0:4;
h=[1 0 -1 -1 1];
N=length(x);
m=0:N-1;

hf=h(pmodulo(-m,N)+1);
y=zeros(1,N);
for n=0:N-1
    hs=hf(pmodulo(m-n,N)+1);
    y(n+1)=sum(hs.*x);
end
ny=0:N-1;

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
a.data_bounds=[-1,-5;5,5];
xtitle('Tin hieu y(n)','n','y(n)');
xgrid();

subplot(2,2,3);
plot2d3(nx-0.05,ex,style=2);
plot2d3(ny+0.05,ey,style=5);
a=gca();
a.data_bounds=[-1,0;5,17];
xtitle('Nang luong tung mau','n','nang luong');
legend('|x(n)|^2','|y(n)|^2');
xgrid();

subplot(2,2,4);
bar([Ex Ey],0.8,'blue');
a=gca();
a.data_bounds=[0.5,0;2.5,55];
xtitle('Tong nang luong: Ex = '+string(Ex)+' (cot 1), Ey = '+string(Ey)+' (cot 2)');
xgrid();

disp(Ex);
disp(Ey);
