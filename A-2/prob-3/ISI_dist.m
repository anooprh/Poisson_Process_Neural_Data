clear;

load 'non_homogenous_poisson.mat';

spike_counr_for_angle = 0;
for j=1:100
    spike_train = spike_train_container{j};
    spike_location = find(spike_train);
    isis = spike_location(2:end) - spike_location(1:end-1);

end
count_frequencies = unique(isis);
counts = histc(isis,count_frequencies);
m = mean(counts);
plot(counts/sum(counts));
hold on;
empirical_dist = exppdf(m/sum(counts), 0:0.1:1);
plot(empirical_dist/max(empirical_dist), '-or');

xlabel('ISI Value');
ylabel('Number Of Occurances');
str = sprintf('ISI Distribution');
legend('Actual Distribution', 'Exponential Distribution');
title(str);
