#!/bin/bash
dir=$(find $(pwd) -name "templates")

if [[ ! $dir ]]; then
  echo 'Create templates'
  exit
fi

if [[ ! $1 ]]; then
  echo 'No parameters found.'
  exit
fi

######Default options######
#if [[ ! $3 ]]; then
#  mkdir -p components/$2/$1
#  cp templates/components/TemplateName.jsx components/$2/$1/$1.jsx
#  cp templates/components/index.jsx components/$2/$1/index.jsx
#  cp templates/components/templatename.module.sass components/$2/$1/${1,,}.module.sass
#
#  sed -i s/templatename/${1,,}/g components/$2/$1/${1,,}.module.sass
#  sed -i s/templatename/${1,,}/g components/$2/$1/$1.jsx
#  sed -i s/TemplateName/$1/g components/$2/$1/$1.jsx
#  sed -i s/TemplateName/$1/g components/$2/$1/index.jsx
#
#  echo 'Component created'
#  exit
#fi

if [[ ! $3 ]]; then
  mkdir -p $2/$1
  cp templates/components/TemplateName.jsx $2/$1/$1.jsx
  cp templates/components/index.jsx $2/$1/index.jsx
  cp templates/components/templatename.module.sass $2/$1/${1,,}.module.sass

  sed -i s/templatename/${1,,}/g $2/$1/${1,,}.module.sass
  sed -i s/templatename/${1,,}/g $2/$1/$1.jsx
  sed -i s/TemplateName/$1/g $2/$1/$1.jsx
  sed -i s/TemplateName/$1/g $2/$1/index.jsx

  echo 'Component created'
  exit
fi

######Models component######

if [[ $3 == 'models' ]]; then
  mkdir -p $3
  cp templates/$3/TemplateName.models.js $3/$1.models.js
  sed -i s/TemplateNameSchema/$1Schema/g $3/$1.models.js
  sed -i s/TemplateName/$1s/g $3/$1.models.js
  echo 'Component created'
  exit

fi

######PAGE component######
if [[ $3 == 'pages' ]]; then
  mkdir -p pages/$1
  cp templates/components/TemplateName.jsx pages/$1/$1.jsx
    cp templates/components/index.jsx pages/$1/index.jsx
    cp templates/components/templatename.module.sass pages/$1/${1,,}.module.sass

    sed -i s/templatename/${1,,}/g pages/$1/${1,,}.module.sass
    sed -i s/templatename/${1,,}/g pages/$1/$1.jsx
    sed -i s/TemplateName/$1/g pages/$1/$1.jsx
    sed -i s/TemplateName/$1/g pages/$1/index.jsx
  echo 'Component created'
  exit
fi
######SVG component######

if [[ $3 == 'svg' ]]; then
  mkdir -p components/$2/$3
  cp templates/svg/TemplateName.jsx components/$2/$3/$1.jsx

  sed -i s/templatename/${1,,}/g components/$2/$3/$1.jsx
  sed -i s/TemplateName/$1/g components/$2/$3/$1.jsx

  echo 'Component created'
  exit
else
  echo 'Error component name'
  exit
fi
