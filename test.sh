  

  
    link="https://github.com/codeclysm/extract/tree/master/evil_generator/culo"
    # extract the protocol
    proto="$(echo $link | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${link/$proto/})"
    # extract the user (if any)
    user="$(echo $url | grep @ | cut -d@ -f1)"
    # extract the host and port
    hostport="$(echo ${url/$user@/} | cut -d/ -f1)"
    # by request host without port    
    host="$(echo $hostport | sed -e 's,:.*,,g')"
    # by request - try to extract the port
    port="$(echo $hostport | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
    # extract the path (if any)
    path="$(echo $url | grep / | cut -d/ -f2-)"

    res="$(echo ${path%/*})"
    # res="$(echo ${path##*.})"

    echo $proto
    echo $url
    echo $user
    echo $hostport
    echo $host
    echo $port
    echo $path
    echo $res
    echo `echo $0`  

#     python3 -c "
# from urllib import parse
# url = "http://www.example.org/default.html?ct=32&op=92&item=98"
# parse.urlsplit(url)
# SplitResult(scheme='http', netloc='www.example.org', path='/default.html', query='ct=32&op=92&item=98', fragment='')
    
#     "



    


build_string="100 99 98"
build_list=($build_string)

echo $build_list
for i in "${build_list[@]:0}"
   do  echo "i: " $i
done