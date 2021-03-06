function Cyclogon(N, l)
t = linspace(-pi/2+pi/N, 3*pi/2-pi/N, N); del = t(2)-t(1);
x = cos(t); y = sin(t) - sin(t(1)) + l; xe = x(end); ye = y(end);
polygon = fill(x, y, 'b', 'FaceAlpha',0.3); hold on;
cyclogon = plot(xe, ye, 'k'); 
pt = plot(xe, ye, 'ok', 'MarkerFaceColor', 'k');
plot([-1, 7], l+[0, 0], 'k'); daspect([1,1,1]); axis([-1, 7, -0.1, 11]); 
dt = pi/100; n = ceil(del/dt); dt = del/n; c = cos(dt); s = -sin(dt);
for i = 1:N-1
    for j = 1:n
        xj = [c, -s]*[x-x(i); y-y(i)]; yj = [s, c]*[x-x(i); y-y(i)];
        x = xj+x(i); y = yj+y(i);
        polygon.XData = x; polygon.YData = y;
        xe = x(end); ye = y(end);
        cyclogon.XData = [cyclogon.XData, xe];
        cyclogon.YData = [cyclogon.YData, ye];
        pt.XData = xe; pt.YData = ye;
        drawnow
    end
end