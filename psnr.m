function z = psnr( x, y )
    [n,m]=size(x);
    z=double(x)-double(y);
    somme=0;
    for i=1:n
        for j=1:m
            somme=somme+(z(i,j)*z(i,j));
        end
    end
    er=somme/(m*n);
    z=10*log10((255*255)/er);
end

