clear all;
kappa = 1; % shear rate
Tmax=100; % max time wall

filename='A0d33_2';% filename of data. You can select what you want
PP=load(['PP\' filename]);% load data of point-particle

PR=load(['PR\' filename]);% load data of point-particle


ind0=find(PP.T*PP.kappa<=PP.Tmax);
ind1=find(PR.T*PR.kappa<=PR.Tmax);

% trajectory for the end-point of the spheroid symmetry axis
figure(1)
plot3(PP.npx(ind0),PP.npz(ind0),PP.npy(ind0),'k','LineWidth',1.2);
hold on
plot3(PR.npx(ind1),PR.npz(ind1),PR.npy(ind1),'r','LineWidth',1.2);
plot3(PP.npx(1),PP.npz(1),PP.npy(1),'bo','MarkerFaceColor','b','MarkerSize',15)
axis equal;
xlim([-1,1])
ylim([-1,1])
zlim([-1,1])
xlabel('x');
ylabel('z');
zlabel('y');
set(gca,'YDir','reverse')
grid on
[X,Y,Z]=sphere(50);
surf(X,Y,Z,'facecolor',[0.8,0.8,0.8],'EdgeColor','none','facealpha',0.7)
hold off
set(gca,'FontSize',12)

% orientation
figure(2)
plot(PP.T(ind0)*PP.kappa,PP.npx(ind0),'k--',PP.T(ind0)*PP.kappa,PP.npy(ind0),'r--',PP.T(ind0)*PP.kappa,PP.npz(ind0),'b--','LineWidth',1.5);
hold on
plot(PR.T(ind1)*PR.kappa,PR.npx(ind1),'k-',PR.T(ind1)*PR.kappa,PR.npy(ind1),'r-',PR.T(ind1)*PR.kappa,PR.npz(ind1),'b-','LineWidth',1.5);
hold off

% rotation: tumbling and spinning velocities
figure(3)
plot(PP.T(ind0)*PP.kappa,PP.tumb(ind0)/PP.kappa,'k--',PP.T(ind0)*PP.kappa,PP.spin(ind0)/PP.kappa,'r--','LineWidth',1.5);
hold on
plot(PR.T(ind1)*PR.kappa,PR.tumb(ind1)/PR.kappa,'k-',PR.T(ind1)*PR.kappa,PR.spin(ind1)/PR.kappa,'r-','LineWidth',1.5);
hold off