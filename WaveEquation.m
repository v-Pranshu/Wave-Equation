%{
This code plots the solution in the form of contours of a given wave equation whose initial
conditions are as given in the problem sstatement.

It also plots how the wave will propogate with time, the dashed lines in
this plot represent the left and right running waves, and the solution wave
is the average of both these waves.

%}

syms x

a = 18;             % value of 'a' for initial conditions 
timestep = 1;       % time interval after which solution is plotted
timeLimit = 25;     % time untill when solution is plotted

t = 0:timestep:timeLimit;

% Function Definition
y(x) = piecewise((x<-a/2) & (x>-a), a, (x<a/2) & (x>-a/2), a/2, (x<a) & (x>a/2), a, 0);

% Solution of the Wave equation as G(X) = 0
u = 0.5*(y(x+t) + y(x-t));

figure(1);

%plotting contours of the solution
fcontour(@(X,T) 0.5*(y(X+T) + y(X-T)), [-50 50 0 50])
colorbar
pause(0.5);

figure(2);

for i = 1:1:length(t)
    
    disp("iteration number: ")
    disp(i)
    
    disp("t = ")
    disp(t(i))
    
    %Solution which is the average of Left and right running waves
    u = 0.5*(y(x+t(i)) + y(x-t(i)));
    
    % Left running Wave
    lrw = y(x+t(i));
    
    %Right Running Wave
    rrw = y(x-t(i));
    
    fplot(u, '-r');
    hold on
    fplot(lrw, '--b');
    hold off
    hold on
    fplot(rrw, '--g');
    hold off
     
    axis([-90 90, -50 50]);
    pause(0.07);
    hold on
    
    % Clears frame unless its the last iteration
    if i~=length(t)
        clf
    end  
    
end

% Function Definition with Exchanged Initial conditions: 
y(x) = piecewise((x<-a/2) & (x>-a), a/2, (x<a/2) & (x>-a/2), a, (x<a) & (x>a/2), a/2, 0);

figure(3);

%plotting contours of the solution 
fcontour(@(X,T) 0.5*(y(X+T) + y(X-T)), [-50 50 0 50])
colorbar
pause(0.5);

figure(4)
for i = 1:1:length(t)
    
    disp("iteration number: ")
    disp(i)
    
    disp("t = ")
    disp(t(i))
    
    %Solution which is the average of Left and right running waves
    u = 0.5*(y(x+t(i)) + y(x-t(i)));
    
    % Left running Wave
    lrw = y(x+t(i));
    
    %Right Running Wave
    rrw = y(x-t(i));
    
    fplot(u, '-r');
    hold on
    fplot(lrw, '--b');
    hold off
    hold on
    fplot(rrw, '--g');
    hold off
     
    axis([-90 90, -50 50]);
    pause(0.07);
    hold on
    
    % Clears frame unless its the last iteration
    if i~=length(t)
        clf
    end  
    
end

    