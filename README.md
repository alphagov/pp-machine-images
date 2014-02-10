# Performance Platform Machine Images

Builds machine images for use with Performance Platform.

## Dependencies

- [Packer](http://www.packer.io/)
- [Vagrant](http://www.vagrantup.com/)
- Virtualbox

## Usage

```
packer build \
    -var "vm_name=pp-ubuntu-12-04-vagrant" \
    vagrant.json
```
