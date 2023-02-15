﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Olymp_Project.Controllers.Validators;
using System.Net;

namespace Olymp_Project.Controllers
{
    [Route("animals")]
    [ApiController]
    public class AnimalController : ControllerBase
    {
        private readonly IAnimalService _service;
        private readonly IMapper _mapper;

        public AnimalController(IAnimalService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        [HttpGet("{animalId:int}")]
        public async Task<ActionResult<GetAnimalDto>> GetAnimalAsync(long? animalId)
        {
            if (!IdValidator.IsValid(animalId))
            {
                return BadRequest();
            }

            var animal = await _service.GetAnimalAsync((long)animalId);
            
            // TODO: 401: Неверные авторизационные данные.
            if (animal is null)
            {
                return NotFound();
            }
            var animalDto = _mapper.Map<GetAnimalDto>(animal);
            return Ok(animalDto);
        }
    }
}
