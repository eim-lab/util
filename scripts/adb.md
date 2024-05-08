
### home button
adb shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN



### start activity from command line 
~~~ shell
# find main activity
$ adb shell pm list packages | grep 'contacts' 
$ pkg=com.google.android.contacts
$ comp=$(adb shell cmd package resolve-activity --brief -c android.intent.category.LAUNCHER $pkg | tail -1)
$ adb shell cmd activity start-activity $comp
   or
$ adb shell am start -n $comp

# start without activity 
$ adb shell monkey -p $pkg -c android.intent.category.LAUNCHER 1
~~~

### start logcat on an app  
~~~ shell 
$ adb shell run-as my.package.name logcat

# or, for non-debuggable apps 
function logcat {
        # Usage is logcat my.package.name
  pkg="$1"
  shift
  if [ -z "$pkg" ]; then
    >&2 echo 'Usage: logcat pkg ...'
    return 1
  fi

  uid="$(adb shell pm list package -U $pkg | sed 's/.*uid://')"
  if [ -z "$uid" ]; then
    >&2 echo "pkg '$pkg' not found"
    return 1
  fi
  adb logcat --uid="$uid" "$@"
}
~~~



### scan manifest of an apk 
~~~ shell
$ aapt l -a ./app-debug.apk | sed -n -e '/manifest/,$p'  
~~~

### dump packages 
~~~ shell
$ adb shell dumpsys package
$ adb shell pm list packages -f 
~~~

### send broadcast 
~~~ shell
$ adb shell 'am broadcast -a "ro.pub.cs.systems.eim.lab05.startedservice.string" --es  "ro.pub.cs.systems.eim.lab05.startedservice.data" "******** hello world!"'

~~~

### terminate app 
~~~ shell
$ adb shell am kill com.google.android.contacts
$ adb shell am force-stop com.google.android.contacts
~~~

### 

### install, uninstall 
~~~ shell 
$ adb install -t app.apk # test
$ adb uninstall -k <package> # -k = keep data 
~~~


### run binaries 
place in  '/data/local/tmp/' or '/data/data/packageName/files' 

### 



