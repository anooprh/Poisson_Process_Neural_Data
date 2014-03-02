clear;

load 'homogenous_poisson.mat';

% Routine To Plot the Spike histogram
for i=1:size(lambda_list,2)
    figure;
    spike_train_container = cell_holder{i};
    spike_counts = zeros(1,1001);
    for j=1:number_of_trials
        spike_train = spike_train_container{j};
        spike_counts = spike_counts+ spike_train;
    end
    spike_counts = spike_counts /number_of_trials;
    bar(spike_counts);
    xlabel('Time (ms)');
    ylabel('Firing Rates (spikes/second)');
    title_str = sprintf('K = %d', klist(i));
    title(title_str);
end