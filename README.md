XWiki-enterprise-vagrant module for creating out of the box VM's provisioned with XWiki

Details of steps executed in the background. All the steps are parameterized from Maven and can be skipped if needed:

1) Remove existing basebox (optional if user keeps the one already installed)
2) Add baseBox (Optional if the user wants to add another baseBox from URL or local system. The basebox will be installed in ".vagrant.d/boxes" in the user's homedir)
3) Boot the baseBox and provision it (this will create a copy of the baseBox installed in step 2), which will also be provisioned. This temporary VM is stored in "VirtualBox VMs" in the user's homedir)
4) Package the running VM and put the contents in the target/baseBox directory in the Maven module
5) Move the artefact from target/baseBox to target/provisionedBox. This is a Vagrant limitation because it cannot pack the VM directly into another dir

Usage

* when not having a baseBox defined (the module will do it for you): mvn clean verify (install is not necessary since you don't want this in your .m2 dir)
* when already having the baseBox installed: mvn clean verify -Dskip.remove.base.box=true -Dskip.download.baseBox=true (this command will skip the first 2 steps)

For devs, check the pom.xml for comments inside.
