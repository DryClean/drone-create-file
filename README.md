# Drone Write File Plugin

Write a file in your pipeline using a combination of nodejs and shell.

```yaml
pipeline:
  comment-linting:
    image: plugins/drone-create-file
    # Check length of file, if file has anything in it
    # this could be run as an argument of node -e,
    # Example: node -p "\`hello\`.replace(/[^l]/g, '').length"
    #          Counts the occurrences of the letter l in "hello"
    # Example: node -p "\`$(ls)\`.split(/\s+/g).length"
    #          Counts the number of items in the pwd
    # The following could be a regex written to match 0 linting errors
    if: '/\w+/.test(`$(cat reports/lint.txt)`)'
    # eval echo 'module.exports = '$(echo \"$PLUGIN_IF\") > plugin-if.js
    out: "drone-comments/linting"
    body: |
      `**Linting Errors Found**
      \`\`\`
      $(cat reports/lint.txt)
      \`\`\``
```

## Options

`PLUGIN_IF`: **Bash first JavaScript**

`PLUGIN_BODY`: **Bash first JavaScript**

`PLUGIN_OUT`: **String**

> Bash first JavaScript allows only graves (backtick) and single quotes (`'`) during evaluation, while double quotes (`"`) can be used by Bash.

Though documentation is low, peruse the [tests/](./tests/) folder for some examples. 
