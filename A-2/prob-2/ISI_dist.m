clear;

load 'homogenous_poisson.mat';

for i=1:8
    figure
    spike_train_container = cell_holder{i};
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
    empirical_dist = exppdf(1/lambda_list(i), 0:0.1:1);
    plot(empirical_dist, '-or');
    
    xlabel('ISI Value');
    ylabel('Number Of Occurances');
    str = sprintf('ISI Distribution for s = %d * pi/4', i);
    legend('Actual Distribution', 'Exponential Distribution');
    title(str);
end
