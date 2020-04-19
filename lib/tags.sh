# Tags is sort of a database for images, messages, links, etc.
# You can set, delete and retrieve tags from the tags database.
# Tags database is simply a directory with the files named after
# the tag and its content will be the tag's content.
# To not let anyone delete someone's else tag, owner of the tag is
# stored in another directory. This is exactly the same as the tagdb
# but the content will the owner's name.

. lib/utils.sh
. lib/msg.sh

: ${_TAGDB:="${PREFIX}/data/tagdb"}
: ${_OWNDB:="${PREFIX}/data/tagowndb"}

# Is tag present?
# ${1} is the tag's name
tags__ispsr() {
	[ -e "${_TAGDB}/${1}" ]
}

# ${1} is the tag's name and everything else is tag's content
# A message will be echoed back indicating if the tag is set or not.
tags_set() {
	tags__ispsr && {
		echo error: "${1}" already present!
		return 1
	}

	tag="${1}"; shift
	echo "${@}" >${_TAGDB}/"${tag}"
}

# ${1} is the tag's name
tags_get() {
	! tags__ispsr && {
		echo error: "${1}" is not present!
		return 1
	}
	printfile "${_TAGDB}/${1}"
}

# Who is the owner of tag ${1}?
tags_owner() {
	printfile "${_OWNDB}/${1}"
}

# Parse the tag message
# ${1} is the message
tags_parse() {
	:
}