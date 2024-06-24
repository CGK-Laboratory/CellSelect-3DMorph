function change_units(xscale,yscale,zscale)
  xticklabels(cellfun(@(x) str2double(x) * xscale, xticklabels));  
  yticklabels(cellfun(@(x) str2double(x) * yscale, yticklabels));
  ylabel('μm')
  xlabel('μm')

  if nargin == 3 % zscore in the inputs
    zticklabels(cellfun(@(x) str2double(x) * zscale, zticklabels));
    zlabel('μm')
  end
end