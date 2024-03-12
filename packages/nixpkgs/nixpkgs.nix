{ user, pkgs, lib, ... }: {
  environment.systemPackages = lib.mkBefore (
    with pkgs; [
      # classic tools
      file
      hostname
      man
      screen
      tree
      watch
      wget

      # editor
      micro
      nano
      vim
    ]
  );

  home-manager.users.${user} = {
    home.packages = lib.mkBefore (
      (with pkgs; [
        # shell
        nushell
        starship
        xonsh
        xxh

        # cli
        bat
        broot
        btop
        difftastic
        dog
        duf
        dust
        entr
        exif
        eza
        fclones
        fd
        ffmpeg
        fq
        fswatch
        fx
        gnused
        gron
        hexyl
        httpie
        hyperfine
        jc
        jless
        jo
        jq
        jsonnet
        lnav
        lzop
        parallel
        pdfgrep
        peco
        pv
        reflex
        ripgrep
        rq
        rsync
        safe-rm
        sd
        terminal-notifier
        xz
        yq

        # zip
        lz4
        p7zip
        xxHash
        zstd

        # lib
        graphviz

        # doc
        tldr

        # gpg
        gnupg
        pinentry

        # dev
        ast-grep
        capstone
        certstrap
        cfssl
        gh
        git
        git-secrets
        lazygit
        openssl
        pre-commit
        tig

        # db
        mysql
        mysql-client
        pgcli
        redis
        sqlcipher
        sqlite
        sqlite-utils
        sqlite-web

        # python
        black
        mypy
        pipx
        poetry
        python312
        ruff
        virtualenv

        # language
        go
        lua
        nodejs_20
        protobuf
        rustc
        rustpython
        rustup
        yarn

        # AI
        lima
        llm
        ollama

        # Data
        datasette
        visidata

        # cloud
        act
        aws-iam-authenticator
        aws-vault
        awscli2
        flyctl
        saml2aws
        spice-gtk

        # continaer
        docker
        docker-client
        lazydocker

        # hashicorp
        consul
        terraform
        tfswitch
        vault

        # kubernetes
        argocd
        cilium-cli
        cmctl
        cri-tools
        eksctl
        func
        infracost
        istioctl
        k3d
        k6
        k9s
        kind
        kn
        krew
        kube-linter
        kubeconform
        kubectl
        kubectx
        kubent
        kubergrunt
        kubernetes-helm
        kubeshark
        kubetail
        kubie
        kustomize
        minikube
        minio
        skaffold
        stern
        tailspin
        vcluster

        # network
        axel
        caddy
        cloudflared
        dnscrypt-proxy
        iperf3
        minicom
        nmap
        oha
        trippy
        wireguard-go
        wireguard-tools
      ]) ++ (with pkgs.python312Packages; [
        pip
        ipython
        keyring
      ])
    );
  };
}
