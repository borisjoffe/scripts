#!/usr/bin/env python
import os
import json
import string
import datetime


# CHANGE THIS FOLDER TO THE FOLDER WHERE YOUR 'starred.json' and 'liked.json' FILES ARE LOCATED
MY_FOLDER = '~/bak/google-reader-backup_2013-07-02'

files = ['starred.json', 'liked.json']
for FILE1 in files:
	OUTPUT1 = FILE1 + ".html"

	curfile = os.path.expanduser(os.path.join(MY_FOLDER, FILE1))
	outfile = os.path.expanduser(os.path.join(MY_FOLDER, OUTPUT1))
	f = open(curfile, 'r')
	contents = string.join(f.readlines())
	f.close()

	contents = json.loads(contents)
	output = "<html><head></head><body><h1>" + contents['title'] + "</h1>"
	output += '<h3>' + curfile + "</h3>"


	count = 0
	for item in contents['items']:
		a = item['title']
		#b = item
		if not 'canonical' in item:
			b = item['alternate'][0]['href']
		else:
			b = item['canonical'][0]['href']
		output += "<b>" + a + '</b><br>'
		output += '<a href="' + b + '" target="_blank">' + b + '</a>'
		output += '<br>Published: ' + datetime.datetime.fromtimestamp(item['published']).strftime('%Y-%b-%d at %H:%M')
		output += '<br>From <b>' + item['origin']['title'] + '</b>'
		output += '<br>Read state locked: ' + str(item['isReadStateLocked'])
		output += '<hr>'
		count += 1


	output += "</body></html>"

#import codecs
#f = codecs.open(outfile, encoding='utf-8', mode='w')
	f = open(outfile, 'w')
	f.write(output.encode('utf-8'))
	f.close()

	print "Wrote output to", "file://" + outfile
