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
