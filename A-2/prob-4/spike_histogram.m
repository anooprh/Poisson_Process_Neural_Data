clear;

load 'ps2_data';

for i=1:8
    figure;
    spike_counts = zeros(1,500);
    for j=1:182
        spike_train = trial(j,i).spikes;
        spike_counts = spike_counts+ spike_train;
    end
    spike_counts = spike_counts /182;
    bar(spike_counts);
    xlabel('Time (ms)');
    ylabel('Firing Rates (spikes/second)');
    title_str = sprintf('K = %d', i);
    title(title_str);
end