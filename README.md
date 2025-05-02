
# 1. **About Project**

This is a simple CHROOT-USER generator that creates a small Mobile Mini-Arch-linux-File-System (Chroot user).
It includes all the bindings (permissions to bring the FS alive from disk to RAM and allow forking for processor resources and bus access).

Chroot-User is not a VM, hence it does **not** provide network/hardware level isolation, but it does provide **process-level isolation**.



# 2. **Advantages**

* No resource usage like VMs or hypervisors. Acts like a second window of a particular application.
* Keeps the package installer separate between the Host and the Chroot-User.
* Works on **any** Linux distro and **any** architecture.
* Smaller and easy to re-install.



# 3. **Disadvantages**

* No network/hardware isolation.
* Usable only for development, testing, and debugging.
* **No `.yaml` config for environment setup.** *Edit the `"create mini arch.sh"` directly to configure the chroot user.*
* Unsafe if `run "rm -rf /"`



# 4. **Steps to Install**

**I. Git-Clone:**
`git clone https://github.com/karthikvvk/Linux-Sub-User-chroot-user-manager.git`

**II. Give user permission:**
`sudo chmod +x "create mini arch.sh" "unmount mini arch .sh"`

**III. Run Script:**
`./create mini arch.sh`

**IV. Enter name for Chroot-user:**
`miniarch`

**V. Enter name for Mini-user (optional but safer):**
`miniuser`



# 5. **Steps to Uninstall**

**I. Run:**
`./unmount mini arch .sh`

**II. Remove Chroot FS:**
`rm -rf <Chroot-user-path>`



# 6. **Things to Note**

1. Not a VM
2. Advanced method to create a "testing workspace"
3. Be careful when executing **root privilege** commands

