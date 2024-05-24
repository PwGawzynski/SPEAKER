import re

def parse_multipart(body, boundary):

    parts = body.split(boundary)
    
    result = {}
    

    for part in parts:
        if 'Content-Disposition' in part:
            name_match = re.search(r'name="([^"]+)"', part)
            if name_match:
                name = name_match.group(1)
                value = part.split("\r\n\r\n")[1].split("\r\n")[0]
                result[name] = value.strip()
    return result


def get_boundary(body):
        boundary_match = re.search(r'(--\S+)', body)
        if not boundary_match:
            return None
        return boundary_match.group(1)


def get_text(body):
        boundary = get_boundary(body)

        parsed_body = parse_multipart(body, boundary)
        text = parsed_body.get('text')
        return text