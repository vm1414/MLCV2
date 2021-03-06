function [HA, I1pointsProj]=homography_accuracy(H, I1points, I2points)
    n=size(I1points,1);    
    I1points=[I1points, ones(n,1)];
    I1pointsProj=zeros(n,2); % projected points from I1 to I2
    HA=0;
    for i = 1:n
        tmp=(H*I1points(i,:)');
        I1pointsProj(i,:)=single(round(tmp(1:end-1)./tmp(3)));
        dist=sqrt(sum((I1pointsProj(i,:)-I2points(i,:)).^2));
        HA=HA+dist;
    end
    HA=HA/n;
end