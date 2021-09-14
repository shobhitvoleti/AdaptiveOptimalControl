figure(1)
subplot(2,1,1)
p1 = plot(out.x);
ylabel('State')
grid on
title('Plot for HJI control')
subplot(2,1,2)
p2 = plot(out.u);
ylabel('Control')
grid on
title('')