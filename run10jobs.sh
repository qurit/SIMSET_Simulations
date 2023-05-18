# Folder to save data in for this current job
savedir=results
# Location of the phg file in SIMSET installation
photon_history_generator_path=/home/gpuvmadm/SimSET/bin/phg

# Runs 9 jobs in parallel
for i in {0..9}
do 
  sed -i "s/FILENAMEWEIGHT/sinogram${i}.hst/" testPET.bin_params
  ${photon_history_generator_path} testPET.phg_params &
  sleep 5
  sed -i "s/sinogram${i}.hst/FILENAMEWEIGHT/" testPET.bin_params
done

# Move output to corresponding folder
mkdir ${savedir}
mv sinogram* ${savedir}
mv groundtruth* ${savedir}
mv col_history ${savedir}