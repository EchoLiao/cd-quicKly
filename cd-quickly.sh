
// add these lines to ~/.bashrc

cdqf=$HOME/.cd_quickly_history
function cd()
{
    cdtf=/tmp/tmp3234_23933333_cd_tmp
    dst="$@"

    if [[ $# != 0 ]]; then
        ret=`sed -ne "${1}p" $cdqf 2>/dev/null`
        [[ ! -z $ret ]] && {
            dst=$ret
        }
    else
        dst=$HOME
    fi

    builtin cd "$dst" && pwd

    echo -e "`pwd`" >> $cdqf
    cat $cdqf | sort -u >> $cdtf
    mv -f $cdtf $cdqf
}

function c()
{
    cat $cdqf | nl
}

function cg()
{
    c | grep -i "$1"
}

function cr()
{
    cdtf=/tmp/tmp3234_23937793_cd_tmp
    [[ $# != 0 ]] && {
        `sed -e "${1}d" $cdqf 1>$cdtf 2>/dev/null`
        mv -f $cdtf $cdqf
    }
}

