#!/usr/bin/env python3

import shutil
from pathlib import Path
import glob
import re
import os
import subprocess
import xml.etree.ElementTree as XMLTree
import itertools
import json
import logging
import urllib.request as request

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def command(cmd):
	logging.info(f'Executing command: {cmd}')
	subprocess.check_call(cmd, shell=True)

def download_latest(repo, suffix):
	api_request = request.Request(f'https://api.github.com/repos/{repo}/releases/latest')
	with request.urlopen(api_request) as response:
		if response.status != 200:
			raise ValueError(f'Failed to fetch latest release from {repo}: {response.status}')
		data = json.load(response)
	for asset in data['assets']:
		if asset['name'].endswith(suffix):
			download_url = asset['browser_download_url']
			break
	else:
		raise ValueError(f'Cannot find assets in the latest release of {repo}')
	if Path(asset['name']).exists():
		logging.info(f'{asset["name"]} already exists, skipping download.')
		return asset['name']
	logging.info(f'Downloading {asset["name"]} from {download_url}...')
	download_request = request.Request(download_url)
	with request.urlopen(download_request) as response:
		if response.status != 200:
			raise ValueError(f'Failed to download {download_url}: {response.status}')
		with open(asset['name'], 'wb') as f:
			f.write(response.read())
	return asset['name']

def backup_otherwise_original(path):
	bak_path = Path('backup/' + path)
	if bak_path.exists():
		return bak_path
	else:
		return Path('decompiled/' + path)

def make_backup(path):
	bak_path = Path('backup/' + path)
	if bak_path.exists():
		return
	bak_path.parent.mkdir(parents=True, exist_ok=True)
	shutil.copy2('decompiled/' + path, bak_path)

def replace_in_file(path, replacements):
	bak_path = Path('backup/' + path)
	with open(backup_otherwise_original(path), 'r') as f:
		original = f.read()
	src_path = Path('decompiled/' + path)
	replaced = original
	for pattern, repl in replacements:
		if isinstance(pattern, re.Pattern):
			replaced = pattern.sub(repl, replaced)
		else:
			replaced = replaced.replace(pattern, repl)
	if replaced != original:
		logging.info(f'Patching {src_path}...')
		make_backup(path)
		with open(src_path, 'w') as f:
			f.write(replaced)

def replace_in_file_bin(path, replacements):
	bak_path = Path('backup/' + path)
	with open(backup_otherwise_original(path), 'rb') as f:
		original = f.read()
	path = Path('decompiled/' + path)
	replaced = original
	for pattern, repl in replacements:
		replaced = replaced.replace(pattern, repl)
	if replaced != original:
		logging.info(f'Patching {path}...')
		if not bak_path.exists():
			bak_path.parent.mkdir(parents=True, exist_ok=True)
			shutil.copy2(path, bak_path)
		with open(path, 'wb') as f:
			f.write(replaced)

def png_size(path):
	with open(path, 'rb') as f:
		header = f.read(24)
		width = int.from_bytes(header[16:20], 'big')
		height = int.from_bytes(header[20:24], 'big')
	return width, height

JAVA_COMMAND = os.getenv('JAVA_COMMAND', 'java')
REPLACEMENT_SERVER_URL = os.getenv('REPLACEMENT_SERVER_URL', 'http://127.0.0.1:13839/i-am-so-happy/assets/')

if os.getenv('IMAGEMAGICK_COMMAND', ''):
	IMAGEMAGICK_COMMAND = os.getenv('IMAGEMAGICK_COMMAND')
elif shutil.which('magick'):
	IMAGEMAGICK_COMMAND = 'magick'
elif shutil.which('convert'):
	IMAGEMAGICK_COMMAND = 'convert'
else:
	IMAGEMAGICK_COMMAND = ''

if os.getenv('APKEDITOR_COMMAND', ''):
	APKEDITOR_COMMAND = os.getenv('APKEDITOR_COMMAND')
elif shutil.which('APKEditor'):
	APKEDITOR_COMMAND = 'APKEditor'
else:
	APKEDITOR_COMMAND = f'{JAVA_COMMAND} -jar {download_latest("REAndroid/APKEditor", ".jar")}'

if os.getenv('APKTOOL_COMMAND', ''):
	APKTOOL_COMMAND = os.getenv('APKTOOL_COMMAND')
elif shutil.which('apktool'):
	APKTOOL_COMMAND = 'apktool'
else:
	APKTOOL_COMMAND = f'{JAVA_COMMAND} -jar {download_latest("iBotPeaches/Apktool", ".jar")}'

if os.getenv('SIGNING_COMMAND', ''):
	SIGNING_COMMAND = os.getenv('SIGNING_COMMAND')
else:
	if not Path('keystore.jks').exists():
		logging.info('Generating keystore.jks...')
		command(f'keytool -genkey -v -keystore keystore.jks -alias charwasp -keyalg RSA -keysize 2048 -validity 10000 -storepass 000000 -keypass 000000 -dname "CN=unknown, OU=unknown, O=unknown, L=unknown, ST=unknown, C=unknown"')
	SIGNING_COMMAND = 'apksigner sign --verbose --ks keystore.jks --ks-key-alias charwasp --ks-pass pass:000000 --key-pass pass:000000'

# Merge APKs
if Path('merged.apk').exists():
	logging.info('Merged APK already exists, skipping merge step.')
else:
	command(f'{APKEDITOR_COMMAND} merge -i apk -o merged.apk')

# Decompile APK
if Path('decompiled').exists():
	logging.info('Decompiled directory already exists, skipping decompile step.')
else:
	command(f'{APKTOOL_COMMAND} decode merged.apk -o decompiled')

# Change server URL
logging.info('Changing server URL...')
manifest_path = glob.glob('assets/*.manifest', root_dir='decompiled')[0]
with open(backup_otherwise_original(manifest_path)) as f:
	manifest = json.load(f)
server_url = manifest['packageUrl']
if len(server_url) != len(REPLACEMENT_SERVER_URL):
	raise ValueError(f'Package URL length mismatch: {len(server_url)} != {len(REPLACEMENT_SERVER_URL)}')
replace_in_file(manifest_path, [[re.compile(re.escape(server_url)), REPLACEMENT_SERVER_URL]])
for file_path in glob.iglob('lib/**/*.so', root_dir='decompiled', recursive=True):
	replace_in_file_bin(file_path, [[server_url.encode(), REPLACEMENT_SERVER_URL.encode()]])

# Bypass signature verification
logging.info('Bypassing signature verification...')
smali_classes_index = next(i for i in itertools.count(2) if not Path(f'decompiled/smali_classes{i}').exists())
if Path(f'decompiled/smali_classes{smali_classes_index-1}/io/github/charwasp/bypass.smali').exists():
	logging.info('Signature verification bypass library already exists, skipping copy step.')
else:
	shutil.copytree('sig-killer', f'decompiled/smali_classes{smali_classes_index}')
for file_path in glob.iglob('smali*/**/*.smali', recursive=True, root_dir='decompiled'):
	replace_in_file(file_path, [
		[
			re.compile(r'invoke-virtual \{(.*)\}, Landroid/content/pm/SigningInfo;->getApkContentsSigners\(\)\[Landroid/content/pm/Signature;'),
			r'invoke-static {\1}, Lio/github/charwasp/bypass;->getApkContentsSigners(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;'
		]
	])

# Change package name
logging.info('Changing package name...')
make_backup('AndroidManifest.xml')
package_name = XMLTree.parse('backup/AndroidManifest.xml').getroot().attrib['package']
new_package_name = package_name + '.charwasp'
replace_in_file('AndroidManifest.xml', [[package_name, new_package_name]])
replace_in_file('apktool.yml', [[re.compile(r'(renameManifestPackage: )null'), r'\1' + new_package_name]])

# Change app icon and title screen
if IMAGEMAGICK_COMMAND:
	logging.info('Changing icon and title screen...')
	title_sprites_path = 'assets/Top/sprites.png'
	logging.info(f'Patching decompiled/{title_sprites_path}...')
	make_backup(title_sprites_path)
	command(f'{IMAGEMAGICK_COMMAND} backup/{title_sprites_path} \\( -background none -density 1000 icon.svg -resize 47x \\) -geometry +1515+93 -compose over -composite decompiled/{title_sprites_path}')
	icon_path = 'res/drawable-xhdpi/icon.png'
	logging.info(f'Patching decompiled/{icon_path}...')
	make_backup(icon_path)
	width, height = png_size('backup/' + icon_path)
	command(f'{IMAGEMAGICK_COMMAND} -background none -density 1000 icon.svg -resize {width}x{height} decompiled/{icon_path}')
else:
	logging.info('ImageMagick not found, skipping change of icon and title screen.')

# Build APK
command(f'{APKTOOL_COMMAND} build decompiled -o modified.apk')
command(f'{SIGNING_COMMAND} modified.apk')
