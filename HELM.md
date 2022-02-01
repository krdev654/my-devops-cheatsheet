------
HELM Char
------

Documentation reference: https://docs.bitnami.com/tutorials/create-your-first-helm-chart/#step-1-generate-your-first-chart

* To install helm
```
brew install helm
```

* To create a new chart
```
helm create <char-name>
```

* To dry-run
```
helm install --dry-run --debug ./<chart-name> --generate-name 
```
