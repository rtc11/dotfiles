function validate_fasit_resource()
{
	curl "https://fasit.adeo.no/api/v2/scopedresource?alias=$1&type=$2&application=$3&environment=$4&zone=FSS"
}

if [ $# -eq 4 ]; then
	validate_fasit_resource $1 $2 $3 $4
else
	echo "Usage: validate alias type application environment"
	echo "Example: validate drekDS datasource drek u2"
fi
