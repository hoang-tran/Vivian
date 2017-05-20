def podNimble
  pod 'Nimble', '~> 6.0.0'
end

target 'Vivian' do
  use_frameworks!

  target 'VivianUnitTests' do
    inherit! :search_paths
    pod 'Quick', '~> 1.0.0'
    podNimble
  end
  
  target 'VivianUITests' do
    inherit! :search_paths
    pod 'KIF', '~> 3.0' 
    podNimble
  end

end
