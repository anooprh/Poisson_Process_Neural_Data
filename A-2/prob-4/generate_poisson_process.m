clear;

load ps2_data.mat

klist = 0:7;
lambda_list = [30*pi/180, 70*pi/180, 30*pi/180, 110*pi/180, 150*pi/180, 190*pi/180, 230*pi/180, 310*pi/180, 350*pi/180 ];

%Cell for holding 8 angles
cell_holder = cell(size(lambda_list,2),1);


% Size of each step
dt = 0.001;
% Window length in seconds
window_length = 0.5;
% Time chain
time = 0.0000:dt:window_length;



for i=1:8
    figure;
    rand_five = randi([1,182], 1, 5);
    [st1, st2, st3, st4, st5]  = trial(rand_five).spikes;
    st = [st1; st2; st3; st4; st5];
    for k=1:5
        subplot(5,1,k);
        stem(st(k,:));
        xlabel('Time (ms)');
        ylabel('Spikes');
        title_str = sprintf('K = %d', i);
        title(title_str);
    end
end


