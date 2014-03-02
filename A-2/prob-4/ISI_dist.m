clear;

load 'ps2_data';

spike_counr_for_angle = 0;
for i=1:8
    figure;
    for j=1:182
        spike_train = trial(j,i).spikes;
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
    str = sprintf('ISI Distribution K = %d',i);
    legend('Actual Distribution', 'Exponential Distribution');
    title(str);
end