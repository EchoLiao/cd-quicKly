
// add these lines to ~/.bashrc

function cd()
{
    tf=/tmp/tmp1234_23333333
    pad=`echo -e \011`
    if [[ $# == 0 ]]; then
        dst="$HOME"
    else
        dst="$@"
    fi

    rm -f $tf
    echo -e ${cd_history//"$pad"/\\n} | sort -u | nl |
    while read line
    do 
        nr=`echo $line | awk '{ print $1}'`
        if [[ "$1" == $nr ]]; then
            dst=`echo -e ${line//"$nr"/}` # QQQQQ
            echo $dst > $tf
            break
        fi
    done

    if [[ -e $tf ]]; then 
        dst=`head -1 $tf`
    fi

    builtin cd "$dst"

    if [[ -z "$cd_history" ]]; then
        cd_history="`pwd`"
    else
        cd_history="$cd_history"$pad"`pwd`"
    fi

    # echo -e ${cd_history//"$pad"/\\n} | sort -u | nl
}


function c()
{
    echo -e ${cd_history//"$pad"/\\n} | sort -u | nl
}

