# Setup

## Step

- `start-gateway.sh`

```bash
  #Main start script
CONF_FOLDER="./thingsboard_gateway/config"
firstlaunch=${CONF_FOLDER}/.firstlaunch

if [ ! -f ${firstlaunch} ]; then
    cp -r /default-config/config/* /thingsboard_gateway/config/
    cp -r /default-config/extensions/* /thingsboard_gateway/extensions/
    touch ${firstlaunch}
    echo "#Remove this file only if you want to recreate default config files! This will overwrite exesting files" > ${firstlaunch}
fi
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

python ./thingsboard_gateway/tb_gateway.py

```

## Troubleshooting

- default-config 반영되지 않음

```bash
root@9904503896a6:/# python ./setup.py install
running install
/usr/local/lib/python3.9/site-packages/setuptools/command/install.py:34: SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.
  warnings.warn(
/usr/local/lib/python3.9/site-packages/setuptools/command/easy_install.py:144: EasyInstallDeprecationWarning: easy_install command is deprecated. Use build and pip and other standards-based tools.
  warnings.warn(
running bdist_egg
running egg_info
writing thingsboard_gateway.egg-info/PKG-INFO
writing dependency_links to thingsboard_gateway.egg-info/dependency_links.txt
writing entry points to thingsboard_gateway.egg-info/entry_points.txt
writing requirements to thingsboard_gateway.egg-info/requires.txt
writing top-level names to thingsboard_gateway.egg-info/top_level.txt
reading manifest file 'thingsboard_gateway.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
adding license file 'LICENSE'
writing manifest file 'thingsboard_gateway.egg-info/SOURCES.txt'
installing library code to build/bdist.linux-x86_64/egg
running install_lib
running build_py
/usr/local/lib/python3.9/site-packages/setuptools/command/build_py.py:153: SetuptoolsDeprecationWarning:     Installing 'thingsboard_gateway.config' as data is deprecated, please list it in `packages`.
    !!


    ############################
    # Package would be ignored #
    ############################
    Python recognizes 'thingsboard_gateway.config' as an importable package,
    but it is not listed in the `packages` configuration of setuptools.

    'thingsboard_gateway.config' has been automatically added to the distribution only
    because it may contain data files, but this behavior is likely to change
    in future versions of setuptools (and therefore is considered deprecated).

    Please make sure that 'thingsboard_gateway.config' is included as a package by using
    the `packages` configuration field or the proper discovery methods
    (for example by using `find_namespace_packages(...)`/`find_namespace:`
    instead of `find_packages(...)`/`find:`).

    You can read more about "package discovery" and "data files" on setuptools
    documentation page.


!!

  check.warn(importable)
```
