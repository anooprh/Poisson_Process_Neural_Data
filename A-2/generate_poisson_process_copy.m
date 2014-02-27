clear all
close all

% Constants
T = 5; % Duration in Seconds
dt = .00001; % Time Step (Seconds)
r = 100; % Firing Rate in Hz
time = (0:dt:T); % Time Vector

% rand('state',sum(100*clock)) % Seed random number generator

% We want a mean firing rate of r Hz. So we want r spikes in
% 1 second. There are 1/dt points in 1 second so we want r
% spikes every 1/dt points.
pspike = r*dt; % Probability of Spiking at each point in time

spike=pspike > rand(size(time)); % Fire with poisson distribution
N=length(find(spike)); % Number of spikes
tspike = time(spike); % Matrix containing spike times

FiringRate = N/T; % Spike Count Rate
ISI = diff(tspike); % Interspike Intervals

meanISI = mean(ISI); % Mean Interspike Interval
stdISI = std(ISI); % Standard Deviation of Interspike Intervals
Cv = stdISI./meanISI; % Coefficient of variation

% Figure 1: Spike Train;
figure
stairs(time,spike)
title('Spike Train'), xlabel('Time (s)')

% Figure 2: Interspike Intervals
figure
hist(diff(1e3*tspike),60)
title('Interspike Interval Histogram')
xlabel('Interspike Interval (ms)'), ylabel('# of Occurrances')

disp(' ')
disp(['Expected Firing Rate = ',num2str(r)])
disp(['Duration = ',num2str(T),' seconds'])
disp(['Number of Spikes = ',num2str(N)])
disp(['Firing Rate = ',num2str(FiringRate), ' Hz'])

disp(['Mean Interspike Interval = ',num2str(1e3*meanISI), ' ms'])
disp(['Standard Deviation of Interspike Intervals = ',num2str(1e3*stdISI),' ms'])
disp(['Coefficient of Variation = ',num2str(Cv)])