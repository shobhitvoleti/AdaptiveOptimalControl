figure(1)

subplot(1,2,1)
plot(out.x1)
grid on
ylabel('x_1')
title('X_1 vs Time')

subplot(1,2,2)
plot(out.x2)
grid on
ylabel('x_2')
title('X_2 vs Time')


figure(2)
plot(out.u_obt)
grid on
ylabel('u')
title('Control vs Time')

figure(3)
p_a = [];
x_1a = [];
x_2a = [];
x_3a = [];
x_4a = [];
for i = 1:10:200
    p_arr1 = out.P_arr(i,:);
    p_a = [p_a;p_arr1];
    x_1a = [x_1a;1];
    x_2a = [x_2a;2];
    x_3a = [x_3a;3];
    x_4a = [x_4a;4];
end

p1n = [p_a(:,1)];
p2n = p_a(:,2);
p3n = p_a(:,3);
p4n = p_a(:,4);

subplot(2,2,1)
plot(x_1a,p1n,'*')
hold on
plot(1,1.297,'ro')
ylim([0,2])
title('Estimating P_{11}')
legend('Estimate','True')

subplot(2,2,2)
plot(x_2a,p2n,'*')
hold on
plot(2,0.1623,'ro')
ylim([0,2])
title('Estimating P_{12}')
legend('Estimate','True')

subplot(2,2,3)
plot(x_3a,p3n,'*')
hold on
plot(3,0.1623,'ro')
ylim([0,2])
title('Estimating P_{21}')
legend('Estimate','True')

subplot(2,2,4)
plot(x_4a,p4n,'*')
hold on
plot(4,0.3075,'ro')
ylim([0,2])
title('Estimating P_{22}')
legend('Estimate','True')





