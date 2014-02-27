clear;

load 'homogenous_poisson.mat';

for i=1:8
    figure;
    spike_train_container = cell_holder{i};
    spike_counts = zeros(1,1001);
    for j=1:100
        spike_train = spike_train_container{j};
        spike_counts = spike_counts+ spike_train;
    end
    spike_counts = spike_counts /100;
    bar(spike_counts);
    xlabel('Time (ms)');
    ylabel('Firing Rates (spikes/second)');
    title_str = sprintf('K = %d', klist(i));
    title(title_str);
end