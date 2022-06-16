resource "azurerm_resource_group" "arg-1" {
  name     = "arg-1"
  location = "West Europe"
}
resource "azurerm_storage_account" "asg-acc-1" {
  name                = "azurestorage1u720485"
  resource_group_name = azurerm_resource_group.arg-1.name
  location           = azurerm_resource_group.arg-1.location
  account_tier = "Standard"
  account_replication_type="LRS"

}
resource "azurerm_storage_container" "cont-1" {
    name = "azure-storage-1-cotainer"
    storage_account_name=azurerm_storage_account.asg-acc-1.name
    container_access_type = "private"
}
resource "azurerm_storage_blob" "blob-1" {
  name="azure-storage-1-cotainer-blob"
  storage_account_name = azurerm_storage_account.asg-acc-1.name
  storage_container_name = azurerm_storage_container.cont-1.name
  type="Block"
}