clear;

load 'non_homogenous_poisson.mat';


spike_counts = zeros(1,1001);
for j=1:100
    spike_train = spike_train_container{j};
    spike_counts = spike_counts+ spike_train;
end
spike_counts = spike_counts /100;
subplot(2,1,1)
bar(spike_counts);
xlabel('Time (ms)');
ylabel('Firing Rates (spikes/second)');
title_str = sprintf('Spike Histogram');
title(title_str);

subplot(2,1,2)
plot(lambda);
xlabel('Time (ms)');
ylabel('Firing Rate λ');
title_str = sprintf('Spike Histogram');
title(title_str);


