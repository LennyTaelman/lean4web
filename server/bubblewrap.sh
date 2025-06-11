#/bin/bash

# Limit CPU time per process to 1h
ulimit -t 3600
# NB: The RSS limit (ulimit -m) is not supported by modern linux!

LEAN_ROOT="$(cd $1 && lean --print-prefix)"
LEAN_PATH="$(cd $1 && lake env printenv LEAN_PATH)"

PROJECT_NAME="$(realpath $1)"

# # print commands as they are executed
# set -x

if ! command -v bwrap >/dev/null 2>&1; then
  echo "bwrap is not installed! You could try to run the development server instead."
  # # Could run without bubblewrap like this, but this might be an unwanted
  # # security risk.
  # (exec
  #   cd $1
  #   lake serve --
  # )
else
  (exec bwrap\
    --ro-bind "$1" "/$PROJECT_NAME" \
    --ro-bind "$LEAN_ROOT" /lean \
    --ro-bind /usr /usr \
    --dev /dev \
    --tmpfs /tmp \
    --proc /proc \
    --symlink usr/lib /lib\
    --symlink usr/lib64 /lib64\
    --symlink usr/bin /bin\
    --symlink usr/sbin /sbin\
    --clearenv \
    --setenv PATH "/lean/bin" \
    --setenv LAKE "/no" `# tries to invoke git otherwise` \
    --setenv LEAN_PATH "$LEAN_PATH" \
    --unshare-user \
    --unshare-pid  \
    --unshare-net  \
    --unshare-uts  \
    --unshare-cgroup \
    --die-with-parent \
    --chdir "/$PROJECT_NAME/" \
    lean --server
  )
fi
