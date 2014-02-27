clear;
% Size of each step
dt = 0.001;
% Window length in seconds
window_length = 1;
% Time chain
time = 0.0000:dt:window_length;

r0 = 30;
rmax = 60;
smax = pi /2;
klist = 0:7;
s = (time .^ 2)*pi;

lambda = r0 + (rmax - r0) * cos(s - smax);


lambda_max = max(lambda);

spike_train_container = cell(100,1);
for k = 1:100
    spike_train = zeros(1, size(time, 2));
    % Poissrnd, rand - Using method 2 discussed in class
    number_of_spikes = poissrnd(lambda_max * window_length);
    time_of_spikes = rand(1, number_of_spikes) * window_length;
    time_of_spikes = floor(time_of_spikes * 100)/100;

    for i=time_of_spikes
        if i ~= 0 && lambda(floor(i * 1000)) / lambda_max > rand();
            spike_train(floor(i * 1000)) = 1;
        end
    end
    spike_train_container(k) = mat2cell(spike_train);
end

rand_five = randi([1,100], 1, 5);
[st1, st2, st3, st4, st5]  = spike_train_container{rand_five};
st = [st1; st2; st3; st4; st5];
for k=1:5
    subplot(5,1,k);
    stem(st(k,:));
    xlabel('Time (ms)');
    ylabel('Spikes');
    title_str = sprintf('Non Homogenous Poisson Process');
    title(title_str);
end


save ('non_homogenous_poisson.mat');

