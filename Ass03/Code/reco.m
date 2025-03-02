function FRF_reco = reco(vparre, reinge)
%REDO Bella
%   Nope
    nPeaks = size(vparre,2);
    meas = size(vparre,1);
    m_i = vparre(:,:,1); 
    c_i = vparre(:,:,2); 
    k_i = vparre(:,:,3); 
    Aj = vparre(:,:,4);
    Bj = vparre(:,:,5);
    omega = 2*pi.*reinge;
    FRF_reco = zeros(meas, length(reinge));
    
    for mm = 1:meas
        for pp = 1:nPeaks
            FRF_reco(mm,:) = FRF_reco(mm,:) + ...
                (Aj(mm,pp) + 1i*Bj(mm,pp))./(- m_i(mm,pp).*omega.^2 + 1i*c_i(mm,pp).*omega + k_i(mm,pp));
        end
    end
    

end

