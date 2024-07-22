These *"modules"* may be installed separately os provided and are likely included in other complete scripts. This is a location where they can be edited once and all the other packaged scripts are consistent.
  
- Install ***startnode*** to run your node with redundancy and potential advanced features:
  - `wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/startnode-installer.sh| sudo bash`
    - Run with: `./startnode.sh`
      - Includes restart redundancy for the slim chance the node drops to bash.
      - Timestamp for when node started or failed.
  
- Install ***TPS-Report*** to watch your average Tokens Per Second:
  - `wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/TPS-Report-installer.sh| sudo bash`
    - Run with: `./TPS-Reports.sh`
      - No cover sheet required ;-)

- Install ***nvitop*** for GPU monitoring: (notice, this is not nvtop, this is nv'i'top)
  - `wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvitop-installer.sh| sudo bash`
    - Run with: `./nvitop.sh`

- Install ***glances*** for system resource monitoring:
  - `wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/glances-installer.sh| sudo bash`
    - Run with: `./glances.sh` or simply type `glances`
      - a *glances.sh* file is supplied in home folder so user finds and remembers it exists whenever they list the home directory.
  
- Install ***nvtop*** for GPU monitoring: (notice, this is not nvitop, or nv'i'top)
  - `wget -qO - https://raw.githubusercontent.com/MachoDrone/UbDt2204modules/main/nvtop-installer.sh| sudo bash`
    - Run with: `./nvtop.sh`or simply type `nvtop`
      - - a *nvtop.sh* file is supplied in home folder so user finds and remembers it exists whenever they list the home directory.
        - this is an older, and perhaps, less informative product than nvitop.
          
      .

      more to come
