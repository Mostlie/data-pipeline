# Ben Fasoli

site   <- 'lgn'

# Load settings and initialize lock file
source('/uufs/chpc.utah.edu/common/home/lin-group2/measurements-beta/proc/_global.r')
lock_create()

try({
  # Licor 6262 -----------------------------------------------------------------
  instrument <- 'licor_6262'
  proc_init()
  nd <- cr1000_init()
  update_archive(nd, data_path(site, instrument, 'raw'))
  nd <- licor_6262_qaqc()
  update_archive(nd, data_path(site, instrument, 'qaqc'))
  nd <- licor_6262_calibrate()
  update_archive(nd, data_path(site, instrument, 'calibrated'))
})

lock_remove()
