clear;

load 'homogenous_poisson.mat';

for i=1:8
    spike_train_container = cell_holder{i};
    spike_counr_for_angle = 0;
    for j=1:100
        spike_train = spike_train_container{j};
        spike_count_in_train = size(find(spike_train),2);
        spike_counr_for_angle = spike_counr_for_angle + spike_count_in_train;
        plot(i, spike_count_in_train,'o');
        hold on
    end
    mean_spike_count_for_angle = spike_counr_for_angle /100;
    plot(i, mean_spike_count_for_angle, 'r*');
    hold on
end
plot(klist+1, lambda_list,'g')
hold on
xlabel('k');
legend('Reaching Angle = k-1 * pi /4');
ylabel('Firing Rates');
title_str = sprintf('Tuning Curve');
title(title_str);
