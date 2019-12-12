#!/bin/bash
blink_app_iphone=25208709
ipad_blink=25181693
mother=25181693
spin-researchable-worker() {
  curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer ${DIGITALOCEAN_ACCESS_TOKEN}" -d \
    '{
      "name":"researchable-worker",
      "region":"ams3",
      "size":"s-1vcpu-1gb",
      "image":"docker-18-04",
      "ssh_keys":[25468266],
      "backups":false,
      "ipv6":false,
      "user_data":"
        #!/bin/bash
        adduser --quiet --disabled-password --gecos '"'"'Mario Rios,,,,,'"'"' mario
        usermod -aG sudo,docker mario
        #su mario
        #mkdir ~/svc-data-integrations ~/u-can-act
        #git clone https://scripts:'"${GITLAB_TOKEN}"'@gitlab.com/researchable/sport-data-valley/mvp/base-platform.git ~/base-platform
      ",
      "private_networking":null,
      "volumes": null,
      "tags":[]
    }' "https://api.digitalocean.com/v2/droplets"
  watch "doctl compute droplet list"
}
spin-vpn() {
    curl -X POST -H 'Content-Type: application/json' \
        -H "Authorization: Bearer ${DIGITALOCEAN_ACCESS_TOKEN}" -d \
        '{"name":"vpn","region":"ams3","size":"s-1vcpu-1gb","image":"openvpn-18-04", "ssh_keys":[25468266]}' \
        "https://api.digitalocean.com/v2/droplets"
}
alias dio=doctl
alias diocdl="dio compute droplet list"
alias diocdd="dio compute droplet delete"
