import re

# https://github.com/30350n/inventree_part_import_config/blob/master/hooks.py
class ApiPartMock:
    description: str
    image_url: str
    supplier_link: str
    SKU: str
    manufacturer: str
    manufacturer_link: str
    MPN: str
    quantity_available: float
    packaging: str
    category_path: list[str]
    parameters: dict[str, str]
    price_breaks: dict[int, float]
    currency: str


def fix_tme_url_czech(api_part: ApiPartMock):
    # I want to use language: EN but get czech links
    # TODO this does not produce a 100% valid link
    # https://www.tme.eu/cz/details/keys948/rj-connectors/keystone/948/
    # vs valid: https://www.tme.eu/cz/details/keys948/konektory-rj/keystone/948/
    # however, it seems to get translated when I visit it
    if "tme.eu/en/" in api_part.supplier_link:
        api_part.supplier_link = api_part.supplier_link.replace("tme.eu/en/", "tme.eu/cz/")


def translate_laskakit_mpn(api_part: ApiPartMock):
    if not api_part.supplier_link.startswith("https://www.laskakit.cz"):
        return

    # TODO reuse existing part name
    print(f"Please translate part name: {api_part.MPN}")
    api_part.MPN = input("part name: ") or api_part.MPN


def map_tme_parameters(api_part: ApiPartMock):
    if ( "DC contacts rating @R" in api_part.parameters
            and "Rated Voltage" not in api_part.parameters
            and "Rated Current" not in api_part.parameters):
        contacts_rating = api_part.parameters["DC contacts rating @R"]

        if m := re.match(r'(?P<current>[0-9.]+ ?A) ?/ ?(?P<voltage>[0-9.]+ ?V)( DC)?', contacts_rating):
            api_part.parameters["Rated Voltage"] = m.group('voltage')
            api_part.parameters["Rated Current"] = m.group('current')
