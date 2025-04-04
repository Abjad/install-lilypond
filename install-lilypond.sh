#!/bin/bash
set -e

LILYPOND_VERSION=2.25.25
CHECKSUM="3fd9c1248ddd9e0617f8fa5c770850870d17cac848fe7924e052e11eff72a26a"

echo "Installing LilyPond version: ${LILYPOND_VERSION}"
lilypond_archive="lilypond-${LILYPOND_VERSION}-linux-x86_64.tar.gz"
base_url="https://gitlab.com/lilypond/lilypond/-/releases"
lilypond_url="${base_url}/v${LILYPOND_VERSION}/downloads/${lilypond_archive}"

wget -q --tries=3 --timeout=30 "${lilypond_url}"
if [ ! -f "${lilypond_archive}" ]; then
  echo "LilyPond archive not found!"
  exit 1
fi

echo "${CHECKSUM}  ${lilypond_archive}" > checksum.txt
sha256sum -c checksum.txt --status
rm checksum.txt

tar -xf "${lilypond_archive}"
echo "LilyPond installed successfully."
