clear;
close all;

%% Load
% Give the location of the MAT files you want to use
% ims = load_mats('/home/ecestudent/Documents/sample-data/ssfp_fourier_basis_good_snr');
ims = load_mats('/home/ecestudent/Documents/sample-data/SSFP Spectral Profile ShortTR 12152017');
ims = reshape(ims,6,[]).'; % images come 6 at a time

for ii = 1:size(ims,1)
    %% Select the patch we want to work with
    ims0 = ims{ii,1};
    [ idx, idy ] = select_patch(ims0);
    %idy = 1:size(ims0,1);
    %idx = 1:size(ims0,2);
    patches = zeros(length(idy),length(idx),6);
    for k = 1:6
        patches(:,:,k) = ims{ii,k}(idy,idx);
    end

    %% Make Basis, find coefficients
    slices = abs(squeeze(patches(:,floor(size(patches,2)/2),:)));

    Q = make_basis(slices);
    h = disp_basis(Q,'Measured Basis');

    % Desired test functions
    cp = center_pulse(size(Q,1));
    ocp = offcenter_pulse(size(Q,1));

    % Grab the coefficients
    c = Q\cp;
    c2 = Q\ocp;

    %% Show me the results
    compare_plot(cp,abs(Q*c),'Measured, Centered Pulse');
    compare_plot(ocp,abs(Q*c2),'Measured, Offcenter Pulse');
    
    %% Apply to whole image
    toapply = reshape(cell2mat(ims(ii,:)),size(ims0,1),size(ims0,2),6);
    apply(c,abs(toapply));
end