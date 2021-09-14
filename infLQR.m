
% Implements LQR control for an unstable second order dynamical system
% x1dot = x2
% x2dot = -omega^2*x1 - 2*zeta*omega*x2 + omega^2*u

% System Data
 
A = [0 1; -3 -2];
B = [0; 1];
nx = size(A,2); 
nu = size(B,2);
%
Xs0     = [5; 0];
tfinal = 10; 
dt     = 0.01;
tvec   = 0:dt:tfinal;
%%%%%%%%%%%%%%%%%%%%
%
Q = eye(nx); R = 1;

%%%%%%%%%%%%%%%%%%%%%%%%

Pinf = care(A,B,Q,R); % There are other arguments in CARE that are not needed here
%
X0 = Xs0;
[tv, yinf] = ode45(@sysde, tvec, X0, [], A, B, Q, R, Pinf);
% Evaluate the Control History for Plotting
for ct = 1:length(tvec)
    Xinf      =  yinf(ct,:)';
    Uinf(ct,1) = -(B'*Pinf)*Xinf;
end

% ---------------------------
% Plot results
figure(3)
subplot(121), plot(tvec, yinf(:,1), 'linewidth',2); xlabel('Time (s)'); ylabel('state X_1'); title('LQR - Infinite Horizon');
subplot(122), plot(tvec, yinf(:,2), 'linewidth',2); xlabel('Time (s)'); ylabel('state X_2'); title('LQR - Infinite Horizon');
%
figure(4)
plot(tvec, Uinf, 'linewidth',2), xlabel('Time (s)'); ylabel('control'); title('LQR - Infinite Horizon');

%%%%%%%%%%%%%%%%%%%%%%%
%    LOCAL FUNCTIONS %%
%%%%%%%%%%%%%%%%%%%%%%%
function xd = sysde(t, x, A, B, Q, R, P)
K = R\(B'*P);
u = -K*x;
xd = A*x + B*u;
end