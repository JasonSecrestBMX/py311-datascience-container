#!/bin/bash

echo "#" >> requirements.history
echo "# '`pip freeze`' on `date`" >> requirements.history
echo "#" >> requirements.history
pip freeze >> requirements.history